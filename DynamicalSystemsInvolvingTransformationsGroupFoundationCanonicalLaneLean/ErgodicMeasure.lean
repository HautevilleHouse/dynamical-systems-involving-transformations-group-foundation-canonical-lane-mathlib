import Mathlib.MeasureTheory.Measure.MeasureSpace
import Mathlib.Dynamics.Ergodic.MeasurePreserving

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure ErgodicMeasurePackage {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    [MeasurableSpace X] (A : GroupActionPackage G X) where
  invariantMeasure : MeasureTheory.Measure X
  measurePreserving : Prop
  ergodicity : Prop
  mixingProperty : Prop

structure ErgodicMeasureEvidence {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    [MeasurableSpace X] {A : GroupActionPackage G X} (P : ErgodicMeasurePackage A) where
  measurePreservingClosed : P.measurePreserving
  ergodicityClosed : P.ergodicity
  mixingPropertyClosed : P.mixingProperty

def ErgodicMeasureClosed {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    [MeasurableSpace X] {A : GroupActionPackage G X} (P : ErgodicMeasurePackage A) : Prop :=
  P.measurePreserving ∧ P.ergodicity ∧ P.mixingProperty

theorem ergodic_measure_closed_from_evidence
    {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    [MeasurableSpace X] {A : GroupActionPackage G X} (P : ErgodicMeasurePackage A)
    (E : ErgodicMeasureEvidence P) : ErgodicMeasureClosed P := by
  exact And.intro E.measurePreservingClosed (And.intro E.ergodicityClosed E.mixingPropertyClosed)

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse