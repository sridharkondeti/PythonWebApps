# Install Docker
sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update

sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg     lsb-release

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
       $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io


# Build Docker image
sudo docker build -t python-hw .

# Run Docker image
sudo docker run -p 5000:5000 python-hw


# Push and Pull images to GCR
# Authenticate
gcloud auth login

gcloud auth configure-docker

gcloud auth activate-service-account demosvc@demoproject-323305.iam.gserviceaccount.com --key-file=demoproject-323305-5b62c68ebf1f.json

# Push
docker push gcr.io/demoproject-323305/python-hw

# Pull
docker pull gcr.io/demoproject-323305/python-hw
