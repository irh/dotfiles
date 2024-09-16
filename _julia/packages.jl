println("Installing Julia packages...")

import Pkg

Pkg.add("DSP")
Pkg.add("FFTW")
Pkg.add("Interact")
Pkg.add("IJulia")
Pkg.add("LanguageServer")
Pkg.add("Plots")
Pkg.add("WAV")

println("Building Julia packages")

Pkg.build()
