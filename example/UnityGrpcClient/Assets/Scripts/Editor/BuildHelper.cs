#if UNITY_EDITOR_OSX

using System.IO;
using UnityEngine;
using UnityEditor;
using UnityEditor.Callbacks;
using UnityEditor.iOS.Xcode;

public class BuildHelper
{
    // Add libresolv.tdb when building for iOS
    // Thanks to https://gist.github.com/eppz/1ebbc1cf6a77741f56d63d3803e57ba3

    [PostProcessBuildAttribute(1)]
    public static void OnPostProcessBuild(BuildTarget target, string path)
    {
        if (target == BuildTarget.iOS)
        {
            var projectPath = PBXProject.GetPBXProjectPath(path);
            var project = new PBXProject();
            project.ReadFromString(File.ReadAllText(projectPath));
            var targetGUID = project.TargetGuidByName(PBXProject.GetUnityTargetName());

            project.AddFrameworkToProject(targetGUID, "libresolv.tbd", false);

            File.WriteAllText(projectPath, project.WriteToString());
        }
    }
}

#endif
