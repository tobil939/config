# Grundlegende Konfiguration für qutebrowser
config.load_autoconfig()

# :tabnew für einen neuen Tab (mit oder ohne URL)
# config.bind(':tabnew', 'open -t')
c.aliases["tabnew"] = "open -t"

# :tabs zeigt die Liste der offenen Tabs an
# config.bind(':tabs', 'tab-list')
c.aliases["tabs"] = "tab-select"

# :tabclose schließt den aktuellen Tab
# config.bind(':tabclose', 'tab-close')
c.aliases["tabclose"] = "tab-close"

# :tabonly schließt alle Tabs außer dem aktuellen
# config.bind(':tabonly', 'tab-only')
c.aliases["tabonly"] = "tab-only"

# :vs für vertikalen Split (zwei Tabs nebeneinander)
# config.bind(':vs', 'window-only ;; spawn --userscript qutebrowser_split')
c.aliases["vs"] = "open -w"

# Normal-Modus: gt für nächsten Tab
config.bind("gt", "tab-next")

# Normal-Modus: gT für vorherigen Tab
config.bind("gT", "tab-prev")

# Normal-Modus: 2gt für zweiten Tab (numerische Auswahl)
config.bind("2gt", "tab-select 2")

# Zurueck in History
config.bind("u", "back")

# ZurueckZuruek in History (forward)
config.bind("U", "forward")

# Neu laden
config.bind("r", "reload")

# Dark Mode aktivieren
c.colors.webpage.darkmode.enabled = True

# Shortcut zum Umschalten des Dark Mode (z. B. F12)
config.bind("<F12>", "config-cycle colors.webpage.darkmode.enabled")

# Optional: Startseite setzen
c.url.start_pages = ["https://www.google.com"]

# Optional: Feintuning des Dark Mode (Beispiel)
c.colors.webpage.darkmode.policy.images = "never"  # Keine invertierten Bilder
