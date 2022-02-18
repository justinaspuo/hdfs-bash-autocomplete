# HDFS directory completer

## Configuration
There are 2 options how to enable HDFS autocompletion
1. Source file *hdfs_autocompletion*. This will enable autocompletion in current session.
2. Execute script *configure.sh*.<br>
This will enable autocompletion permanently.
The script will create directory *.bash_completion.d* in your home dir (if it does not exist) and will copy
file *hdfs_complete* here. It will also update *.bash_completion* file so that the completion would be available
in each session.

## Usage
HDFS autocompletion works exactly the same as usual tab completion.<br>
Type one of the defined commands followed by HDFS directory followed by (single or double) tab.<br>

**Example: hls /user/tmp\<TAB>**
### Available commands:
* hls 
* hrm 
* hrmr
* hput
* hget
* hcp
* hmv
* hcat
* hchmod
* hmkdir
* hdu

Check for available commands in file **hdfs_autocomplete** (look for defined aliases in the very beginning).<br>
Change defined aliases in file *hdfs_autocomplete* if you need to run commands under different user.

### Other
Say you mostly use only what's inside directory /user/hive/warehouse/ but rarely check parent directories. <br>
Change variable ***start_suggestions_from*** in file ***hdfs_autocomplete*** like this:<br> 
**start_suggestions_from="/user/hive/warehouse/"**<br>

Now when you type **hls \<TAB>** it will immediatelly give **hls /user/hive/warehouse/**.
