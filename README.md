# grpc-unity-package [![Build Status](https://travis-ci.org/jsmouret/grpc-unity-package.svg?branch=master)](https://travis-ci.org/jsmouret/grpc-unity-package)

gRPC Unity Package

---
# Update!

gRPC now has an official yet experimental package for Unity.
* Head over to https://packages.grpc.io/
* Pick the last link in the Build ID column
* Look for grpc_unity_package.x.y.z-dev.zip in the C# section
* Unzip into your Assets folder
* Profit!

---
## What is it?

Just a bunch of scripts and a travis config to build a nice package to support gRPC in Unity Engine.

It aims to be as vanilla as possible.

## What's supported?

gRPC 1.13.0

* Windows / Linux / OSX are extracted straight from the official Nuget package
* Android and iOS are built using Travis

## How to run the example?

* Clone this repository without submodules
* If creating a fresh project, ensure .NET 4.x is enabled
* Download the latest zip from [releases](https://github.com/jsmouret/grpc-unity-package/releases)
* Unzip it in `example/UnityGrpcClient/Assets`
* Open `example/UnityGrpcClient` in Unity
* Run the SampleScene
* Profit!

## Help wanted!

Tests and feedbacks are welcomed. Let's make Unity and gRPC work smoothly together.

## References

* gRPC Team scripts: https://github.com/grpc/grpc/tree/master/src/csharp/experimental
* Where it started: https://github.com/neuecc/MagicOnion
* Where it continued: http://examinedself.com/cross-compile-grpc-unity/

### Enjoy!
