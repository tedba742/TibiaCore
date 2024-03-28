============== How compiler distro ===============
========= Microsoft Visual Studio 2017 ============
=================== Windows =======================
git clone https://github.com/Microsoft/vcpkg
cd ./vcpkg
./bootstrap-vcpkg.bat
./vcpkg integrate install
./vcpkg install --triplet x64-windows boost-iostreams boost-asio boost-system boost-filesystem boost-variant boost-lockfree luajit libmariadb pugixml cryptopp fmt mpir

=============== Ubuntu ========================
sudo apt install git cmake build-essential libluajit-5.1-dev libmariadb-dev-compat libboost-date-time-dev libboost-filesystem-dev libboost-system-dev libboost-iostreams-dev libpugixml-dev libgmp3-dev libcrypto++-dev libfmt-dev libjsoncpp-dev
cd compiler
mkdir build && cd build
cmaker ..
make
======= build Anti-RollBack ========
apt-get install gdb
cd compiler
mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=RelWithDebInfo ..
make
