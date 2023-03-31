# Background

Rubin Observatory keeps various non-image data in a S3 datastore called the Large File Annex (LFA). It is necessary to replicate the contents of this datastore at the USDF for read-only access to aid Operator analysis.

This repository essentially runs an instance of mc that uses mirror to connect to both the telescope systems in Chile and the storage at SLAC.
