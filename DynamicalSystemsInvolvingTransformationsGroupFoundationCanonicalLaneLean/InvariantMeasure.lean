import canonicalLaneMathlib.AdmissibleClass

/-!
# Invariant Measure Package

This module defines invariant measures under a group action, a key concept in
dynamical systems and ergodic theory.
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure InvariantMeasure (G : Type u) [Group G] (X : Type v) [TopologicalSpace X]
    [MeasurableSpace X] (F : TransformationsGroupFlow G X) where
  measure : MeasureTheory.Measure X
  invarianceProperty : ∀ (g : G) (B : Set X), MeasurableSet B → F.action g '' B ∈ measure.ae → measure (F.action g '' B) = measure B

structure InvariantMeasureEvidence {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
    [MeasurableSpace X] {F : TransformationsGroupFlow G X} (M : InvariantMeasure G X F) where
  invariancePropertyClosed : M.invarianceProperty

def InvariantMeasureClosed {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
    [MeasurableSpace X] {F : TransformationsGroupFlow G X} (M : InvariantMeasure G X F) : Prop :=
  M.invarianceProperty

theorem invariant_measure_closed_from_evidence
    {G : Type u} [Group G] {X : Type v} [TopologicalSpace X] [MeasurableSpace X]
    {F : TransformationsGroupFlow G X} (M : InvariantMeasure G X F)
    (E : InvariantMeasureEvidence M) : InvariantMeasureClosed M := by
  exact E.invariancePropertyClosed

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse