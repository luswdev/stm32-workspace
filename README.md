# STM32-Workspace

A template for stm32 toolchain cmake workspace.

## Docker Usage

All target must build in docker, to build docker image, use command below:

```bash
./docker/build.sh
```

Run docker and copy project code into container use command below:

```bash
./docker/run.sh
```

## Build Target

When in container, start build target with command:

```bash
./build.sh
```

The default output target name will be `stm32-framework.elf` and `stm32-framework.bin`.
If you want to change it, just replace the project name in `CMakeLists.txt`.

```diff
-project(stm32-framework)
+project(awesome-project)
```
