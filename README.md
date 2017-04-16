## Description
Control wireless lights (milight 3.0) with Jarvis (voice assistant)


<img src="https://raw.githubusercontent.com/QuentinCG/jarvis-milight-3.0/master/milight.jpg" width="800">


## Usage
```
You: Allume le salon/cuisine/toilette/chambre/maison
Jarvis: Zone salon/cuisine/toilette/chambre/maison allumée

You: Eteins le salon/cuisine/toilette/chambre/maison
Jarvis: Zone salon/cuisine/toilette/chambre/maison éteinte

You: Mets le salon/cuisine/toilette/chambre/maison en mode nuit
Jarvis: Mode nuit activé pour la zone salon/cuisine/toilette/chambre/maison

You: Lance le mode disco dans le salon/cuisine/toilette/chambre/maison
Jarvis: Mode disco 5 activé pour la zone salon/cuisine/toilette/chambre/maison

You: Mode disco plus rapide
Jarvis: Mode disco plus rapide pour la zone maison

You: Mode disco plus lent
Jarvis: Mode disco plus lent pour la zone maison

You: Mets la lampe du salon/cuisine/toilette/chambre/maison en rouge/lavande/bleu/eau/vert clair/vert/jaune/orange
Jarvis: Couleur rouge/lavande/bleu/eau/vert clair/vert/jaune/orange activée pour la zone salon/cuisine/toilette/chambre/maison

You: Allume la lumiere du module.
Jarvis: Lampe du module allumée

You: Eteins la lumiere du module
Jarvis: Lampe du module éteinte
```


## How to install

1) Connect your Milight 3.0 wifi bridge to your wifi network (install the android app and follow the instruction: https://play.google.com/store/apps/details?id=com.irainxun.wifilight)

2) Get IP address and port of the wifi bridge (you can for example use this software to help you: http://www.limitlessled.com/download/LimitlessLEDv4.zip)

3) Add this plugin in <a target="_blank" href="http://domotiquefacile.fr/jarvis/content/plugins">Jarvis project</a>

4) Configure the <a target="_blank" href="https://github.com/QuentinCG/jarvis-milight-3.0/blob/master/config.sh">configuration file</a> to match your requirements.

5) Edit the <a target="_blank" href="https://github.com/QuentinCG/jarvis-milight-3.0/blob/master/fr/commands">command file</a> if zone is not compatible with the on defined in the file.

6) Enjoy


## Author
[Quentin Comte-Gaz](http://quentin.comte-gaz.com/)


## License

This project is under MIT license. This means you can use it as you want (just don't delete the plugin header).


## Contribute

If you want to add more examples or improve the plugin, just create a pull request with proper commit message and right wrapping.
