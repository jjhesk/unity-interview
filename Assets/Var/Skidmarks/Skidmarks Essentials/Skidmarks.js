/////////
// Skidmarks.js
//
// This script controlles the skidmarks for the car. It registers the position, normal etc. of all the small sections of
// the skidmarks that combined makes up the entire skidmark mesh.
// A new mesh is auto generated whenever the skidmarks change.
@script RequireComponent(MeshFilter)
@script RequireComponent(MeshRenderer)

var maxMarks : int = 1024;			// Maximum number of marks total handled by one instance of the script.
var markWidth : float = 0.275;		// The width of the skidmarks. Should match the width of the wheel that it is used for. In meters.
var groundOffset : float = 0.02;	// The distance the skidmarks is places above the surface it is placed upon. In meters.
var minDistance : float = 0.1;		// The minimum distance between two marks places next to each other. 

private var indexShift : int;
private var numMarks : int = 0;

// Variables for each mark created. Needed to generate the correct mesh.
class markSection{
	public var pos :  Vector3 = Vector3.zero;
	public var normal : Vector3 = Vector3.zero;
	public var tangent : Vector4 = Vector4.zero;
	public var posl : Vector3 = Vector3.zero;
	public var posr: Vector3 = Vector3.zero;
	public var intensity : float = 0.0;
	public var lastIndex : int = 0;
};

private var skidmarks : markSection[];

private var updated : boolean = false;

//check if at the origin or not and jump to it if not
function Start ()
{
if (transform.position != Vector3(0,0,0))
	transform.position = Vector3(0,0,0);
}

// Initiallizes the array holding the skidmark sections.
function Awake()
{
	skidmarks = new markSection[maxMarks];
	for(var i = 0; i < maxMarks; i++)
		skidmarks[i]=new markSection();
	if(GetComponent(MeshFilter).mesh == null)
		GetComponent(MeshFilter).mesh = new Mesh();
}

// Function called by the wheels that is skidding. Gathers all the information needed to
// create the mesh later. Sets the intensity of the skidmark section b setting the alpha
// of the vertex color.
function AddSkidMark(pos : Vector3, normal : Vector3, intensity : float, lastIndex : int)
{
	if(intensity > 1)
		intensity = 1.0;
	if(intensity < 0)
		return -1;
	var curr : markSection = skidmarks[numMarks % maxMarks];
	curr.pos = pos + normal * groundOffset;
	curr.normal = normal;
	curr.intensity = intensity;
	curr.lastIndex = lastIndex;

	if(lastIndex != -1)
	{
		var last : markSection = skidmarks[lastIndex % maxMarks];
		var dir : Vector3 = (curr.pos - last.pos);
		var xDir : Vector3 = Vector3.Cross(dir,normal).normalized;
		
		curr.posl = curr.pos + xDir * markWidth * 0.5;
		curr.posr = curr.pos - xDir * markWidth * 0.5;
		curr.tangent = new Vector4(xDir.x, xDir.y, xDir.z, 1);
		
		if(last.lastIndex == -1)
		{
			last.tangent = curr.tangent;
			last.posl = curr.pos + xDir * markWidth * 0.5;
			last.posr = curr.pos - xDir * markWidth * 0.5;
		}
	}
	numMarks++;
	updated = true;
	return numMarks -1;
}

// If the mesh needs to be updated, i.e. a new section has been added,
// the current mesh is removed, and a new mesh for the skidmarks is generated.
function LateUpdate()
{






    var wheels : WheelCollider[] = FindObjectsOfType(WheelCollider) as WheelCollider[];
    for (var wheel : WheelCollider in wheels) {

    if(!wheel.GetComponent ("Wheel Skidmarks"))
        wheel.gameObject.AddComponent ("Wheel Skidmarks");

    }



	if(!updated)
	{
		return;
	}
	updated = false;
	
	var mesh : Mesh = GetComponent(MeshFilter).mesh;
	mesh.Clear();
	var segmentCount : int = 0;
	for(var j : int = 0; j < numMarks && j < maxMarks; j++)
		if(skidmarks[j].lastIndex != -1 && skidmarks[j].lastIndex > numMarks - maxMarks)
			segmentCount++;
	
	var vertices : Vector3[] = new Vector3[segmentCount * 4];
	var normals : Vector3[] = new Vector3[segmentCount * 4];
	var tangents : Vector4[] = new Vector4[segmentCount * 4];
	var colors : Color[] = new Color[segmentCount * 4];
	var uvs : Vector2[] = new Vector2[segmentCount * 4];
	var triangles : int[] = new int[segmentCount * 6];
	segmentCount = 0;
	for(var i : int = 0; i < numMarks && i < maxMarks; i++)
		if(skidmarks[i].lastIndex != -1 && skidmarks[i].lastIndex > numMarks - maxMarks)
		{
			var curr : markSection = skidmarks[i];
			var last : markSection = skidmarks[curr.lastIndex % maxMarks];
			vertices[segmentCount * 4 + 0] = last.posl;
			vertices[segmentCount * 4 + 1] = last.posr;
			vertices[segmentCount * 4 + 2] = curr.posl;
			vertices[segmentCount * 4 + 3] = curr.posr;
			
			normals[segmentCount * 4 + 0] = last.normal;
			normals[segmentCount * 4 + 1] = last.normal;
			normals[segmentCount * 4 + 2] = curr.normal;
			normals[segmentCount * 4 + 3] = curr.normal;

			tangents[segmentCount * 4 + 0] = last.tangent;
			tangents[segmentCount * 4 + 1] = last.tangent;
			tangents[segmentCount * 4 + 2] = curr.tangent;
			tangents[segmentCount * 4 + 3] = curr.tangent;
			
			colors[segmentCount * 4 + 0]=new Color(0, 0, 0, last.intensity);
			colors[segmentCount * 4 + 1]=new Color(0, 0, 0, last.intensity);
			colors[segmentCount * 4 + 2]=new Color(0, 0, 0, curr.intensity);
			colors[segmentCount * 4 + 3]=new Color(0, 0, 0, curr.intensity);

			uvs[segmentCount * 4 + 0] = new Vector2(0, 0);
			uvs[segmentCount * 4 + 1] = new Vector2(1, 0);
			uvs[segmentCount * 4 + 2] = new Vector2(0, 1);
			uvs[segmentCount * 4 + 3] = new Vector2(1, 1);
			
			triangles[segmentCount * 6 + 0] = segmentCount * 4 + 0;
			triangles[segmentCount * 6 + 2] = segmentCount * 4 + 1;
			triangles[segmentCount * 6 + 1] = segmentCount * 4 + 2;
			
			triangles[segmentCount * 6 + 3] = segmentCount * 4 + 2;
			triangles[segmentCount * 6 + 5] = segmentCount * 4 + 1;
			triangles[segmentCount * 6 + 4] = segmentCount * 4 + 3;
			segmentCount++;			
		}
	mesh.vertices=vertices;
	mesh.normals=normals;
	mesh.tangents=tangents;
	mesh.triangles=triangles;
	mesh.colors=colors;
	mesh.uv=uvs;
}