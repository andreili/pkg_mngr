#include <stdio.h>
#include "PackageManager.h"

using namespace package_manager;

int main(int argc, char *argv[], char *env[])
{
    PackageManager *manager = new PackageManager();
    manager->init(argc, argv, env);
    if (manager->prepare())
        manager->proc();
    delete manager;
    return 0;
}
