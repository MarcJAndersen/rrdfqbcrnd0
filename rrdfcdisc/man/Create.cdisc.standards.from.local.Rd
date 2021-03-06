% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Create.cdisc.standards.from.local.R
\name{Create.cdisc.standards.from.local}
\alias{Create.cdisc.standards.from.local}
\title{Create local file with CDISC standards using local copy of standards}
\usage{

  Create.cdisc.standards.from.local(cdisc.files.dir = "~/projects/phrmwg/rdf.cdisc.org",
  cdisc.save.zip = file.path(system.file("extdata/CDISC-standards-rdf",
  package = "rrdfcdisc"), "cdisc-rdf.zip"),
  cdisc.save.ttl = file.path(tempdir(), "cdisc-rdf.ttl"),
  remove.cdisc.save.ttl = TRUE,
  CDISCfilelist = Get.filenames.for.cdisc.standards())
}
\arguments{
\item{cdisc.files.dir}{Path to directory with CDISC RDF files}

\item{cdisc.save.zip}{Path and Filename for zip file with CDISC standards}

\item{cdisc.save.ttl}{Filename for CDISC turtle file}

\item{remove.cdisc.save.ttl}{If TRUE then remove the temporary turtle file}

\item{CDISCfilelist}{A list ofe paths for the rdf.cdisc.org standards files.
Default the results of Get.filenames.for.cdisc.standards()}
}
\value{
RRDF model containing CDISC standards stored locally in zip file
}
\description{
Create local file with CDISC standards using local copy of standards
}

