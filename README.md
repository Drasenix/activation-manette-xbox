# activation-manette-xbox

Permet d'activer la manette Microsoft X-Box One S en forçant le déclenchement des vibrations (Linux fix)

**Pour aller plus loin** , si vous voulez que ça se lance automatiquement à chaque branchement, vous pouvez créer une règle udev :

```bash
# /etc/udev/rules.d/99-xbox-controller.rules
ACTION=="add", SUBSYSTEM=="input", ATTRS{name}=="Microsoft X-Box One S pad", \
RUN+="/usr/local/bin/init-xbox-controller.sh"
```

Placez votre script dans `/usr/local/bin/init-xbox-controller.sh`, rendez-le exécutable (`chmod +x`), puis rechargez udev avec `sudo udevadm control --reload-rules`.
