RightSignature PDF Download
======

I was wanting to move from RightSignature to HelloSign. But I had hundreds
of signed PDFs on RightSignature and did NOT want to clicky-click to download
PDFs.

RightSignature provides an API, and computers are good at doing things
automatically; enter this script.

How To
-----

1. Get an API key (read only) from RightSignature. This takes about a day.
2. Clone this repo, and bundle
3. run `export API_KEY=XYZ && ruby right-signature-download.rb`
4. ... (signifying waiting)

How it Works
------------
3. This will download all PDFs into a `docs` directory
4. The files will have `GUID-email.pdf` as well as `GUID.json` if you want more
   details

Requirements
-----

* I ran this on Ruby 2.2, but this _should_ work on Ruby 2.0 and up
* You should have curl installed #sorrynotsorry

Notes
-----

You may not actually need to do this :) From Right Signature staff after
cancelling: "Your login credentials will still gain you access to all of your
executed documents." -- Pretty awesome Right Signature. Pretty Awesome.

License
-------

MIT. Check license file.

