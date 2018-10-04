# install necessary dev tools for make.
sudo yum update -y
sudo yum groupinstall -y "Development Tools"
sudo yum install -y boost-devel openssl openssl-devel

# clone project
git clone https://github.com/chaintope/tapyrus-seeder
cd tapyrus-seeder

#clearn
rm -f dnsseed *.o

# build
make

# install
sudo cp ./dnsseed /usr/bin/dnsseed

