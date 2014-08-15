using UnityEngine;

namespace Aubergine {

	[AddComponentMenu("")]
	public abstract class PostProcessBase : MonoBehaviour {
		//Variables//
		protected Shader shader;
		private Material m_Material;

		//Properties//
		protected Material material {
			get {
				if (m_Material == null) {
					m_Material = new Material(shader);
					m_Material.hideFlags = HideFlags.HideAndDontSave;
				}
				return m_Material;
			} 
		}

		//Mono Methods//
		protected void OnEnable() {
			// Disable if we don't support image effects
			if (!SystemInfo.supportsImageEffects) {
				enabled = false;
				return;
			}
			// Disable the image effect if the shader can't run on the users graphics card
			if (!shader || !shader.isSupported) {
				enabled = false;
				return;
			}
		}

		protected void OnDisable() {
			if( m_Material ) {
				DestroyImmediate(m_Material);
			}
		}
	}

}