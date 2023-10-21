# GodoTabs
 Песенник с аккордами на движке Godot 4


## Команда для сборки приложения с экспортом файла базы данных в корень директории сборки

```
mkdir build
godot -s export_data.gd
godot -e --export-debug "Windows Desktop" 'build/GodoTabs.exe'
```