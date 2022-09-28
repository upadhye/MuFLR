# MuFLR
Multi-Fluid Linear Response code described in https://arxiv.org/abs/2011.12503

MuFLR version 1.0
=
--------------------------------------------------------------------------------

Installation:

MuFLR relies on the GNU Scientific Library (GSL), available at 
https://www.gnu.org/software/gsl/ .  Once this has been installed, edit the 
PATHS variable in Makefile to include the locations of the GSL headers and 
libraries.  Then compile MuFLR using 'make' from the command prompt.

Parallelization in MuFLR uses OpenMP.  The code may be compiled without 
parallelization by deleting the "-fopenmp" flag in the Makefile.

--------------------------------------------------------------------------------

Running:

MuFLR is run directly from the command prompt.  It requires:

  1.  a file params_MuFLR.dat listing the cosmological parameters and 
      code inputs, as detailed in the comments to the sample 
      params_MuFLR.dat file included, and passed as an argument; 

  2.  a transfer function at redshift 0, in the standard 13-column format 
      produced by the CAMB code (https://camb.info), and named as specified
      in params_MuFLR.dat .

A sample params_MuFLR.dat and the corresponding CAMB transfer function file
are included with the code.  Also included are the shell scripts run, which
executes MuFLR, and process_ICs.bash, which processes the result into the
CDM+baryon power spectrum and growth rate at each time step.

--------------------------------------------------------------------------------

Printing results:

MuFLR outputs are governed by the third code switch in params_MuFLR.dat, 
labelled "print results" in the example parameters file.  Values 0-3, 
respectively, refer to the functions print_all_growth, 
print_all_Pcblin_Pcbnl_Pnutot, print_all_Pmono, and print_all_perturbations in 
MuFLR.c.  At each output redshift and each wave number:

  0.  print_all_growth prints the CDM+baryon growth factor D, its logarithic
      derivative f = dln(D)/dln(a), and the total neutrino density monopole;

  1.  print_all_Pcblin_Pcbnl_Pnutot prints the linear CDM+baryon power, the 
      non-linear CDM+baryon power, and the total neutrino monopole power;

  2.  print_all_Pmono prints linear CDM+baryon power, the non-linear CDM+baryon 
      power, and the neutrino power for each fluid individually;

  3.  print_all_perturbations prints all neutrino density and velocity 
      divergence Legendre moments, followed by the linear and non-linear 
      CDM+baryon density and velocity divergence as well as the Time-RG 
      bispectrum integrals.

--------------------------------------------------------------------------------

Tuning performance and outputs:

Default code performance parameters have been chosen for a combination of speed
and accuracy.  The non-negative tolerance parameters PARAM_DETA0, PARAM_EABS, 
and PARAM_EREL in MuFLR.c may be reduced for greater accuracy.  These three are,
respectively, the starting step size in ln(a), the absolute tolerance, and the
relative tolerance.  After changing these parameters, MuFLR must be recompiled.

