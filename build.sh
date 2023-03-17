cd build
docker build -t europe-west2-docker.pkg.dev/canvas-hook-339503/corda/corda:4.10 .
cd build-glcm
docker build -t europe-west2-docker.pkg.dev/canvas-hook-339503/corda/corda-glcm:4.10 .

gcloud auth configure-docker europe-west2-docker.pkg.dev

docker push europe-west2-docker.pkg.dev/canvas-hook-339503/corda/corda:4.10
docker push europe-west2-docker.pkg.dev/canvas-hook-339503/corda/corda-glcm:4.10
