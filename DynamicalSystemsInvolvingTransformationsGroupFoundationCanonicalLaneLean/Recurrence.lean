import canonicalLaneMathlib.AdmissibleClass

/-!
# Recurrence Package

This module defines recurrence properties for group actions, including
Poincaré recurrence typical in conservative dynamical systems.
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure RecurrenceProperty (G : Type u) [Group G] (X : Type v) [TopologicalSpace X]
    (F : TransformationsGroupFlow G X) where
  conservativeSystem : Prop
  poincareRecurrence : Prop
  infiniteReturns : Prop

structure RecurrenceEvidence {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
    {F : TransformationsGroupFlow G X} (R : RecurrenceProperty G X F) where
  conservativeSystemClosed : R.conservativeSystem
  poincareRecurrenceClosed : R.poincareRecurrence
  infiniteReturnsClosed : R.infiniteReturns

def RecurrenceClosed {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
    {F : TransformationsGroupFlow G X} (R : RecurrenceProperty G X F) : Prop :=
  R.conservativeSystem ∧ R.poincareRecurrence ∧ R.infiniteReturns

theorem recurrence_closed_from_evidence
    {G : Type u} [Group G] {X : Type v} [TopologicalSpace X]
    {F : TransformationsGroupFlow G X} (R : RecurrenceProperty G X F)
    (E : RecurrenceEvidence R) : RecurrenceClosed R := by
  exact And.intro E.conservativeSystemClosed
    (And.intro E.poincareRecurrenceClosed E.infiniteReturnsClosed)

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse