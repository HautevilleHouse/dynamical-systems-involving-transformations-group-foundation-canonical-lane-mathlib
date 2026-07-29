import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure InvariantMeasuresPackage (G : GroupActionDynamicsPackage) where
  invariantMeasure : Type u
  ergodicDecomposition : Prop
  measurePreserving : Prop

structure InvariantMeasuresEvidence {G : GroupActionDynamicsPackage}
    (M : InvariantMeasuresPackage G) where
  ergodicDecompositionClosed : M.ergodicDecomposition
  measurePreservingClosed : M.measurePreserving

def InvariantMeasuresClosed {G : GroupActionDynamicsPackage}
    (M : InvariantMeasuresPackage G) : Prop :=
  M.ergodicDecomposition ∧ M.measurePreserving

theorem invariant_measures_closed_from_evidence
    {G : GroupActionDynamicsPackage} (M : InvariantMeasuresPackage G)
    (E : InvariantMeasuresEvidence M) : InvariantMeasuresClosed M := by
  exact And.intro E.ergodicDecompositionClosed E.measurePreservingClosed

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse
