![Kitsu (CGWire) automatic notifications to Discord](https://raw.githubusercontent.com/keshon/assets/main/kitsu-to-discord-task-notification/header.jpeg)

This app automatically sends task status notifications from Kitsu tracker to Discord using a simple schedule. Discord messages can be customized via simple template engine (check /tpl dir).

<kbd>![# Demo](https://raw.githubusercontent.com/keshon/assets/main/kitsu-to-discord-task-notification/demo.gif)</kbd>


## Quick run
Download the latest version (only Windows for now), fill in conf.toml and run it.

### Configuration (conf.toml)
#### Basic
| Variables | Description |
| - | - |
|tplPreset| Name of a subfolder (inside `/tpl`) that contains template files for styling Discord message. Useful for different customizations.
| ignoreMessagesDaysOld | Don't parse tasks from Kitsu older that this value (days). |
| silentUpdateDB | Update local database but dont post anything. Useful for the first run. |
| threads | Increase value to speed up proccesing parsed data - little to no benefit for now |
| debug | Print Kitsu response data to shell |
| log | Print additional information to shell |
#### Kitsu
| Variables | Description |
| - | - |
| hostname | Kitsu hostname like https://example.com/ - trailing slash is required. |
| email | Kitsu account email - account must have `Studio manager` privileges. |
| password | Account password. |
| skipComments | Comments create overhead - skip them if you don't need them. |
| requestInterval | How often (in minutes) to request data from kitsu and publish it to Discord. |
#### Discord
| Variables | Description |
| - | - |
| embedsPerRequests | How many messages (embeds) are in one post in the chat. 10 maximum |
| RequestsPerMinute | How many posts (with messages) per minute can be made. 50 maximum |
| webhookURL | Discord webhook URL address |

### Templating (tpl dir)
The Discord message can be changed using the template files found in the `\tpl` directory.
Each file corresponds to a different element in the Discord embedding structure, and each file has access to the following variables:

| Variables | Description |
| - | - |
| `{{.ProjectName}}` | Production name. |
| `{{.ParentName}}` | Task parent name: can be scenes name or asset type name. |
| `{{.TaskName}}` | Task name |
| `{{.TaskType}}` | Task type |
| `{{.CurrentStatus}}` | Current task type status (got from Kitsu) |
| `{{.PreviousStatus}}` | Previous tast type status (got from local database) |
| `{{.CommentContent}}` | Comment message |
| `{{.CommentAuthor}}` | Comment author |
| `{{.EntityType}}` | Entity type name |

## Compilation
Compilation is straight forward: 
```bash
go build -ldflags "-s -w" -o app.exe src/main.go
```
## Docker
To deploy app via Docker:
1. docker-compose and Traefik is installed
2. Go to `deploy` dir
3. Update kitsu hostname in `.evn` file.
4. `bash run.sh` - exec supplied shell script that will download latest sources, build Docker image and run it via docker-compose.

## What is Kitsu?
Kitsu is a production task tracker for small to midsize animation studios made by CG Wire company based in France.

The software is lightweight and simple with the easiest learning curve of the competition and it provides all nessesary tools to get the job done.

Visit [cg-wire.com](https://cg-wire.com) for more information.
Official [Discord server](https://discord.com/invite/VbCxtKN)

[![CGWire Logo](https://zou.cg-wire.com/cgwire.png)](https://cgwire.com)
