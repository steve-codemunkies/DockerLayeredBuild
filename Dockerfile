FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /app

# First copy the solution file, if you have a nuget config copy it here as well
COPY *.sln .

# Then copy the source projects, they all get put into the same folder
COPY src/*/*.csproj .
# This line then moves the project files to the correct folders
RUN for file in $(ls *.csproj); do mkdir -p src/${file%.*}/ && mv $file src/${file%.*}/; done

# Next copy the test projects, agains they all get put into the same folder
COPY tests/*/*.csproj .
# This line then moves the test project files to the correct folders
RUN for file in $(ls *.csproj); do mkdir -p tests/${file%.*}/ && mv $file tests/${file%.*}/; done

# Now we can restore all the packages that we need
RUN dotnet restore

# Now to copy everything across
COPY . .

# We can now build everything, but we don't need to restore, so tell dotnet to skip that
RUN dotnet build -c Release --no-restore

# And then we can test, but this time we don't build, as we've alredy done that
# You can just do a test instead of build then test, but I've found diagnosing issues easier this way
RUN dotnet test -c Release --no-restore --no-build

# Lastly we need to publish everything
RUN dotnet publish src/ConsoleApp/ConsoleApp.csproj -c Release --no-restore --no-build -o /output

# We're going to base the image we use on the runtime image
FROM mcr.microsoft.com/dotnet/core/runtime:3.1 AS runtime
WORKDIR /app
ENTRYPOINT [ "dotnet", "ConsoleApp.dll" ]
COPY --from=build /output .