% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/objects.R
\docType{class}
\name{TopconsResult-class}
\alias{TopconsResult-class}
\alias{TopconsResult}
\alias{setTOPtibble}
\alias{setTOPtibble,TopconsResult-method}
\alias{getTOPtibble,TopconsResult-method}
\alias{getTOPtibble}
\title{accessor functions for objects of TopconsResult S4 class}
\usage{
setTOPtibble(theObject, top_tibble)

\S4method{setTOPtibble}{TopconsResult}(theObject, top_tibble)

\S4method{getTOPtibble}{TopconsResult}(theObject)
}
\arguments{
\item{theObject}{an object of TopconsResult class}

\item{top_tibble}{parsed TOPCONS output in tabular format}
}
\value{
TopconsResult object
}
\description{
accessor functions for objects of TopconsResult S4 class

Accessors for TopconsResult objects
}
\section{Slots}{

\describe{
\item{\code{top_tibble}}{tibble with outputs obtained from topcons
\itemize{
\item    seq - intermediate sequence id
\item    length - length of the protein sequence
\item    TM - number of transmembrane domains predicted
\item    SP - logical, True if signal peptide is predicted, False - otherwise
\item    source - run type: new or cached
\item    run_time - run time in seconds
\item    gene_id - cropped sequence id (any description if present - removed) #' }}
}}

\examples{
aa <- readAAStringSet(system.file("extdata", "sample_prot_100.fasta",
           package = "SecretSanta"), use.names = TRUE)
inp <- CBSResult(in_fasta = aa)
# predict signal peptides:
sp <- signalp(inp, version = 2, organism = 'euk', run_mode = "starter",
legacy_method = 'hmm')
# integrate topcons predictions
p_dir <- system.file("extdata", "rst_SVw4hG.zip", package = "SecretSanta")
tpc <- topcons(input_obj = sp, parse_dir = p_dir, topcons_mode = "WEB-server",
              TM = 0, SP = TRUE)
tpc
# extract out_fasta slot
getOutfasta(tpc)
# extract topcons summary
getTOPtibble(tpc)            
}
