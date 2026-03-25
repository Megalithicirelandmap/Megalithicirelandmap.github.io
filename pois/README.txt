
this is an experiment, whether or not many small files would make more sense
than a big one for editing.

The filenames are initially constructed from the name of the poi with
'problematic' characters avoided (everything but a-zA-Z0-9-_) and is purely
informational. Choose or rename at will.

Goal is to edit files as simple as

Antrim/Antrim_Castle.poi
```
latlon="54.71549,-6.22356"
name="Antrim Castle"
url="/Antrim%20Castle,%20Antrim.html"
sym="subject#castles"
```

The myriad of single poi files are each converted to gpx and glued together into
`pois.gpx` as described by `Makefile`.

To happen automatically, this, however, requires
https://docs.codeberg.org/codeberg-pages/forgejo-actions/ to be set up, which I
haven't yet.

This would also mean to finally leave the corporate AI-hell github became and
move to the non-profit CodeBerg and leave an automatic redirect at github so as
visitors automatically are sent to https://megalithicirelandmap.codeberg.page.

You would have to register at codeberg and I add you to
https://codeberg.org/Megalithicirelandmap as we did back then at github.

Should we?
