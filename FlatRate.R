# The purpose of this script is to calculate how much money you'll need to put on a Metrocard at once; in order to ensure that with your remaining amount, the value added, AND the bonus value all add up to a number which is divisible by Subway Fare with no remainder. Numbers have been inflated in order to prevent accuracy issues with modulus (dividing and seeking the remainder) and floating point (decimals), because most computer freak out over that. I don't get it, but that's the system.

# Designed for "flat rate" metro systems, which charge a single entry fee and then allow unlimited transfers.

MetrocardFare <- function(ValAdd = 5,ValRat=1.05, ValRem=00.0, ValFee=2.75,LowTen = 0) {
  # This version has been repaired by a professor, to create all the variables when the script is first run.
  
  ValRem <- ValRem * 1000 # The amount remaining on your card, multiplied for the purpose of this function. Don't worry, it'll be resolved in the end.
  ValFin <- ((ValAdd * ValRat) + ValRem)
  worvar1 <- 1000
  
  repeat{ 
    if (worvar1 < 10) {
      LowTen <- append(LowTen, c(ValAdd) )
      worvar1 <- 1000 # So it does not get stuck recording the same value for LowTen.
      
    } else {
      if (length(LowTen) > 10) {
        LowTen <- LowTen / 1000 # Divides the captured values of ValAdd (that work) by 1000, to reflect realistic values which will be what one pays o
        return(LowTen) # So it automatically displays the values afterward. It may be edited here, to instead use Print.csv, or Return, or View. Your choice, if you have a preferred way to view or save the output.
        break } # The lenth of LowTen goes to 11, because it keeps "zero" as the first value which satisfies condition for a value to be appended to this. Perhaps add code to remove the first value, at a later date. Would it be better to run this part with Print.csv() or Return() ?
      else {	
        ValAdd <- ValAdd + 10
        ValFin <- ((ValAdd * ValRat) + ValRem)
        worvar1 <- (ValFin %% (ValFee * 1000)) 
      }	}	}	}
