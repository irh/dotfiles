println("Installing Julia packages...")

Pkg.add("IJulia")
Pkg.add("DSP")

println("Building Julia packages")

Pkg.build()
