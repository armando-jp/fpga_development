# _fpga_proto_sysverilog_chu_ Directory Structure
* _cons_ = board constraint files.
* _projects_ = tcl scripts and active projects.
* _rtl_ = logic source files.
* _sim_ = simulation source files.

# How to Save Vivado Project for Git
1. If open, close project in Vivado.
2. cd to `project` directory in repo.
3. Open project from command prompt (Note: prerequisites are that the `vivado` command be in your PATH)

            vivado .\project_name\project_name.xpr

4. Run `write_project_tcl build_<project_name>` from Tcl Console in Vivado.
5. Close the project and delete it. All that should be left from this process is a new tcl script in the `\projects` directory.
6. Commit the tcl script and any new rtl files to github.

# Rebuilding a Project
1. Open command prompt.
2. cd to `project` directory in repo.
3. Run the following command to rebuild the project

            vivado -mode batch -source <name of tcl script>

4. Open the vivado project by either opening the newly generated .xpr file, or by running

            vivado .\project_name\project_name.xpr

# Notes About Creating New Vivado Projects
* Create new projects in `projects` directory.
* When adding source files, never copy them into project.
