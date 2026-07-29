import canonicalLaneMathlib.ReviewerBridge

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "dynamical-systems-involving-transformations-group-foundation",
  theoremName := "DynamicalSystemsInvolvingTransformationsGroupFoundation",
  theoremObject := "Dynamical Systems Involving Transformations Group Foundation",
  classicalBoundary := "classical source boundary carried by formalization certificate",
  manifoldConstrainedStatement := "admissible-class bridge closure for dynamical systems with transformation groups",
  certificateLane := "manifold_constrained",
  carriedRemainder := "unrestricted classical closure remains carried"
}

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse