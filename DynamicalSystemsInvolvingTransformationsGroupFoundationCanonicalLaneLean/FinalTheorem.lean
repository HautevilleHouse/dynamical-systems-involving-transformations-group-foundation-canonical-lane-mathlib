import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean.TransformationsGroupFlow
import DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean.InvariantMeasure
import DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean.Recurrence
import DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean.ErgodicTheorem

/-!
# Final Theorem Closure

This module defines the constrained closure for the dynamical systems theory
involving transformations group foundation, and provides the endgame proof that
the admissible closure holds.
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

def ConstrainedDynamicalSystemsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dynamical_systems_endgame (A : AdmissibleClass) :
    ConstrainedDynamicalSystemsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse