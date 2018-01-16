# restrict-the-folder-size-in-linux
a script for set size limitation to folder in linux
# Read this before use
<p>When you add the limitation or remove the limitation to that folder, all data in the folder would be removed.</p>
<p>Please back up all the data first, then add limitation. </p>
<p>Do not use "sh" to execute this file, please use "./". They are different</p>

# Usage:
<p><strong>Set size limitation to folder:</strong> ./limit_folder_size.sh add [folder path] [size you wana to set, number only, in megabyte unit]</p>
<p>Example: ./limit_folder_size.sh add /usr/share/test 10</p>
<hr>
<p><strong>Remove size limitation to folder:</strong> ./limit_folder_size.sh drop [folder path]</p>
<p>Example: ./limit_folder_size.sh drop /usr/share/test</p>
