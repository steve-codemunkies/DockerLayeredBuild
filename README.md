# Docker layered build
Demonstrating a layered build, test and publish of a dotnet app

## Sources

* [Optimising ASP.NET Core apps in Docker - avoiding manually copying csproj files](https://andrewlock.net/optimising-asp-net-core-apps-in-docker-avoiding-manually-copying-csproj-files/)
* [Optimising ASP.NET Core apps in Docker - avoiding manually copying csproj files (Part 2) ](https://andrewlock.net/optimising-asp-net-core-apps-in-docker-avoiding-manually-copying-csproj-files-part-2/)
* [Do not ignore .dockerignore (it’s expensive and potentially dangerous)](https://codefresh.io/docker-tutorial/not-ignore-dockerignore-2/) - this is important as if you build locally on windows then do the docker build your build will fail
* [.net core docker hub](https://hub.docker.com/_/microsoft-dotnet-core/)
* [Exploring a docker containers file system](https://stackoverflow.com/a/20816397/747649) - useful when things don't work 😀