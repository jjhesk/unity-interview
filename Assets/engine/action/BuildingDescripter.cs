using UnityEngine;
using System.Collections;

[System.Serializable]
public class BuildingDescripter
{
	public GameObject prefab;
	public Property.locType typebuilding;
	public int basicPrice;
	public string building_name;
	
	public BuildingDescripter ()
	{
	}
	
	public GameObject givePreFab ()
	{
		return prefab;
	}
}