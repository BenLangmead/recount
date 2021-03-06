% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/coverage_matrix.R
\name{coverage_matrix}
\alias{coverage_matrix}
\title{Given a set of regions for a chromosome, compute the coverage matrix for a
given SRA study.}
\usage{
coverage_matrix(project, chr, regions, chunksize = 1000, bpparam = NULL,
  outdir = NULL, chrlen = NULL, verbose = TRUE, verboseLoad = verbose,
  ...)
}
\arguments{
\item{project}{A character vector with one SRA study id.}

\item{chr}{A character vector with the name of the chromosome.}

\item{regions}{A \link[GenomicRanges]{GRanges-class} object with regions
for \code{chr} for which to calculate the coverage matrix.}

\item{chunksize}{A single integer vector defining the chunksize to use for
computing the coverage matrix. Regions will be split into different chunks
which can be useful when using a parallel instance as defined by 
\code{bpparam}.}

\item{bpparam}{A \link[BiocParallel]{BiocParallelParam-class} instance which
will be used to calculate the coverage matrix in parallel. By default, 
\link[BiocParallel]{SerialParam-class} will be used.}

\item{outdir}{The destination directory for the downloaded file(s) that were
previously downloaded with \link{download_study}. If the files are missing, 
but \code{outdir} is specified, they will get downloaded first. By default
\code{outdir} is set to \code{NULL} which will use the data from the web.
We only recommend downloading the full data if you will use it several times.}

\item{chrlen}{The chromosome length in base pairs. If it's \code{NULL}, the 
chromosome length is extracted from the Rail-RNA runs GitHub repository.}

\item{verbose}{If \code{TRUE} basic status updates will be printed along the 
way.}

\item{verboseLoad}{If \code{TRUE} basic status updates for loading the data
will be printed.}

\item{...}{Additional arguments passed to \link{download_study} when
\code{outdir} is specified but the required files are missing.}
}
\value{
A matrix with one row per region and one column per sample. The
numbers in the cells are the counts (number of reads, or fraction in some
cases) overlapping the region.
}
\description{
Given a set of genomic regions as created by \link{expressed_regions}, this
function computes the coverage matrix for a library size of 40 million 100 bp
reads for a given SRA study.
}
\examples{
## Define expressed regions for study DRP002835, chrY
regions <- expressed_regions('DRP002835', 'chrY', cutoff = 5L, 
    maxClusterGap = 3000L)

## Now calculate the coverage matrix for this study
coverageMatrix <- coverage_matrix('DRP002835', 'chrY', regions)

## One row per region
identical(length(regions), nrow(coverageMatrix))

}
\author{
Leonardo Collado-Torres
}
\seealso{
\link{download_study}, \link[derfinder]{findRegions},
\link[derfinder]{railMatrix}
}

