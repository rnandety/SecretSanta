% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/topcons.R
\name{topcons}
\alias{topcons}
\title{parse TOPCONS output}
\usage{
topcons(input_obj, parse_dir, topcons_mode = c("API", "WEB-server",
  "stand-alone"), TM, SP = FALSE)
}
\arguments{
\item{input_obj}{an instance of CBSResult class, produced by previous step;}

\item{parse_dir}{dir with archived topcons output (for WSDL-API or WEB outputs)
or dir with output produced by stand-alone version.}

\item{topcons_mode}{\itemize{
\item    WEB - output from TOPCOS2 web-server \url{http://topcons.net/}
\item    WSDL-API - output returned by WSDL API script \url{http://topcons.net/pred/help-wsdl-api/}
\item    stand-alone - results of TOPCONS stand-alone version \url{https://github.com/ElofssonLab/TOPCONS2}
}}

\item{TM}{allowed number of TM domains in mature peptides,
recommended value <= 1; use TM = 0 for strict filtering}

\item{SP}{filter according to TOPCONS prediction of signal peptides. TRUE - keep only proteins containg signal peptides according to TOPCONS; FALSE - disable filtering for TOPCONS-based predictions of signal peptides. Deafault = FALSE.}
}
\value{
TopconsResult object
}
\description{
This function parses results of TOPCONS method, used to predict transmembrane domains. The parser is restricted to 'piper'-like behaviour.\cr
}
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
}
