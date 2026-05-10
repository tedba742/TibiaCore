# CMake generated Testfile for 
# Source directory: /home/ted/Desktop/projects/ots/TibiaCore/compiler
# Build directory: /home/ted/Desktop/projects/ots/TibiaCore/compiler/build/coverage
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(unit_tests "/home/ted/Desktop/projects/ots/TibiaCore/compiler/build/coverage/unit_tests")
set_tests_properties(unit_tests PROPERTIES  _BACKTRACE_TRIPLES "/home/ted/Desktop/projects/ots/TibiaCore/compiler/CMakeLists.txt;156;add_test;/home/ted/Desktop/projects/ots/TibiaCore/compiler/CMakeLists.txt;0;")
subdirs("src")
subdirs("_deps/googletest-build")
