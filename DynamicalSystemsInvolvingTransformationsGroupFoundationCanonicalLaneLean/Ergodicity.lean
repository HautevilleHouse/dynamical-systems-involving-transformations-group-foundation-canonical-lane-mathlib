import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean.DynamicalSystem
import DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean.GroupAction
import DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean.InvariantSet

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure ErgodicityPackage {S : DynamicalSystem} {G : GroupActionPackage S} where
  invariantMeasure : Measure S.State
  ergodicMeasure : Prop
  decompositionUnique : Prop
  ergodicDecomposition : Prop

structure ErgodicityEvidence {S : DynamicalSystem} {G : GroupActionPackage S} (E : ErgodicityPackage S G) where
  ergodicMeasureClosed : E.ergodicMeasure
  decompositionUniqueClosed : E.decompositionUnique
  ergodicDecompositionClosed : E.ergodicDecomposition

def ErgodicityClosed {S : DynamicalSystem} {G : GroupActionPackage S} (E : ErgodicityPackage S G) : Prop :=
  E.ergodicMeasure ∧ E.decompositionUnique ∧ E.ergodicDecomposition

theorem ergodicity_closed_from_evidence
    {S : DynamicalSystem} {G : GroupActionPackage S} (E : ErgodicityPackage S G)
    (Ev : ErgodicityEvidence E) : ErgodicityClosed E := by
  exact And.intro Ev.ergodicMeasureClosed
    (And.intro Ev.decompositionUniqueClosed Ev.ergodicDecompositionClosed)

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse