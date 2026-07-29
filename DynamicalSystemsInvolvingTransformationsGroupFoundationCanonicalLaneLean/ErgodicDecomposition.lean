import DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean.TransformationsGroup

/-!
# Ergodic Decomposition Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure ErgodicDecompositionPackage {G : DynamicalSpace} {M : InvariantMeasuresPackage G} {T : TransformationsGroupPackage G M} where
  ergodicComponents : Prop
  decompositionExists : Prop
  uniqueErgodicDecomposition : Prop
  ergodicMeasuresDense : Prop

structure ErgodicDecompositionEvidence {G : DynamicalSpace} {M : InvariantMeasuresPackage G} {T : TransformationsGroupPackage G M} (E : ErgodicDecompositionPackage G M T) where
  ergodicComponentsClosed : E.ergodicComponents
  decompositionExistsClosed : E.decompositionExists
  uniqueErgodicDecompositionClosed : E.uniqueErgodicDecomposition
  ergodicMeasuresDenseClosed : E.ergodicMeasuresDense

def ErgodicDecompositionClosed {G : DynamicalSpace} {M : InvariantMeasuresPackage G} {T : TransformationsGroupPackage G M} (E : ErgodicDecompositionPackage G M T) : Prop :=
  E.ergodicComponents ∧ E.decompositionExists ∧ E.uniqueErgodicDecomposition ∧ E.ergodicMeasuresDense

theorem ergodic_decomposition_closed_from_evidence {G : DynamicalSpace} {M : InvariantMeasuresPackage G} {T : TransformationsGroupPackage G M} (E : ErgodicDecompositionPackage G M T) (Ev : ErgodicDecompositionEvidence E) : ErgodicDecompositionClosed E := by
  exact And.intro Ev.ergodicComponentsClosed (And.intro Ev.decompositionExistsClosed (And.intro Ev.uniqueErgodicDecompositionClosed Ev.ergodicMeasuresDenseClosed))

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse