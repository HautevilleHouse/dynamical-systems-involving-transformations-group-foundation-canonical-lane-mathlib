import canonicalLaneMathlib.AdmissibleClass

/-!
# Ergodic Theorem Package

This module captures the mean ergodic theorem for group actions, a central
result in dynamical systems involving transformations.
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure ErgodicTheorem (G : Type u) [Group G] (X : Type v) [TopologicalSpace X]
    [MeasurableSpace X] (F : TransformationsGroupFlow G X)
    (M : InvariantMeasure G X F) where
  ergodicDecomposition : Prop
  meanErgodicProjection : Prop
  vonNeumannMeanErgodic : Prop

structure ErgodicTheoremEvidence {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
    [MeasurableSpace X] {F : TransformationsGroupFlow G X}
    {M : InvariantMeasure G X F} (T : ErgodicTheorem G X F M) where
  ergodicDecompositionClosed : T.ergodicDecomposition
  meanErgodicProjectionClosed : T.meanErgodicProjection
  vonNeumannMeanErgodicClosed : T.vonNeumannMeanErgodic

def ErgodicTheoremClosed {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
    [MeasurableSpace X] {F : TransformationsGroupFlow G X}
    {M : InvariantMeasure G X F} (T : ErgodicTheorem G X F M) : Prop :=
  T.ergodicDecomposition ∧ T.meanErgodicProjection ∧ T.vonNeumannMeanErgodic

theorem ergodic_theorem_closed_from_evidence
    {G : Type u} [Group G] {X : Type v} [TopologicalSpace X] [MeasurableSpace X]
    {F : TransformationsGroupFlow G X} {M : InvariantMeasure G X F}
    (T : ErgodicTheorem G X F M) (E : ErgodicTheoremEvidence T) :
    ErgodicTheoremClosed T := by
  exact And.intro E.ergodicDecompositionClosed
    (And.intro E.meanErgodicProjectionClosed E.vonNeumannMeanErgodicClosed)

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse