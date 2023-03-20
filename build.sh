cd build
docker build -t europe-west2-docker.pkg.dev/canvas-hook-339503/corda/corda:4.9.6 .
cd ../build-glcm
docker build -t europe-west2-docker.pkg.dev/canvas-hook-339503/corda/corda-glcm:4.9.6 .

gcloud auth configure-docker europe-west2-docker.pkg.dev

docker push europe-west2-docker.pkg.dev/canvas-hook-339503/corda/corda:4.9.6
docker push europe-west2-docker.pkg.dev/canvas-hook-339503/corda/corda-glcm:4.9.6
