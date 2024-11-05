## Troubleshot

**Ultisnips doesn't work with markdown files**

Because `<tab>` is already mapped in vimwiki to find the next link, ultisnips 
doesn't doesn't use tab. The solution is to allow tab completion in insert mode, 
and not in normal mode

**To look into**

- [ ] Vim 'conceal'

## Features to implement

- [ ] copy article url in newsboat
- [ ] Obsidian Integration
- [ ] vimwiki-templates => creating templates in vimwiki subfolders



## vimwiki-templates

- create template from subdirectory
    * custom name convention
    * generate previous/next entry
    * go to previous/next page
    * generate index file
    * allow both chronological and tags in the index
    * group template sections together

- Types of entries
    * daily entries (YYYY-MM-DD)
	+ Index is weekly (2024, October, Week 1)
	+ Index is monthly (2024, October)
	+ Index is quarterly (2024, October, Quarter 1)
	+ Index is yearly (2024)
	+ Index based on tags and with chronology
    * weekly entries
	+ Index is monthly (2024, October)
	+ Index is quarterly (2024, October, Quarter 1)
	+ Index is yearly (2024)
	+ Index based on tags and with chronology
    * monthly entries
	+ Index is quarterly (2024, October, Quarter 1)
	+ Index is yearly (2024)
	+ Index based on tags and with chronology


Directories UI Search:
```
1 Journal
2 Logs
3 Notes
```

Sub-directories selections:
```
Journal
> daily
> weekly
> monthly
> yearly
```

```
Index

=== Computer Science ===


=== Physics ===


=== Chemistry ===

```


`vim_templates_list`:
```
let g:vim_templates_list = [
{ "<DIRECTORY_NAME>" : {
    'path': <PATH>, 
    'name': <DIRECTORY_FULL_NAME>, 
    'subdirectories': [{
	'subdirectory_name': <SUBDIRECTORY_NAME>, 
	'template_path': <TEMPLATE_PATH>, 
	'sorting_algo': <SORTING_ALGO>, " regex-like pattern
	'naming_convention': <SORTING_ALGO>, 
	}]
    }
}]
```


Todos:
- define `config` list to use for templates
    * 


not implemented:
- generate page from tags

