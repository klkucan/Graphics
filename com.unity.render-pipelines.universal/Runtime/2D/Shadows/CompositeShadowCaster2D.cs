using System.Collections;
using System.Collections.Generic;
using UnityEngine;


namespace UnityEngine.Experimental.Rendering.Universal
{
    /// <summary>
    /// 
    /// </summary>
    [AddComponentMenu("Rendering/2D/Composite Shadow Caster 2D (Experimental)")]
    [ExecuteInEditMode]
    public class CompositeShadowCaster2D : ShadowCasterGroup2D
    {
        /// <summary>
        /// 
        /// </summary>
        protected void OnEnable()
        {
            ShadowCasterGroup2DManager.AddGroup(this);
        }

        /// <summary>
        /// 
        /// </summary>
        protected void OnDisable()
        {
            ShadowCasterGroup2DManager.RemoveGroup(this);
        }
    }
}
