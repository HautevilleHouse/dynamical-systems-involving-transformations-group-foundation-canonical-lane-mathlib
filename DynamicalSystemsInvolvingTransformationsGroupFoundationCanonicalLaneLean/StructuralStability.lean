import Mathlib.Topology.Homeomorph
import Mathlib.Dynamics.Flow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure StructuralStabilityPackage {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    (A : GroupActionPackage G X) where
  perturbation : GroupActionPackage G X
  conjugateToOriginal : Prop
  smallPerturbationCondition : Prop
  stabilityUnderPerturbation : Prop

structure StructuralStabilityEvidence {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    {A : GroupActionPackage G X} (P : StructuralStabilityPackage A) where
  conjugateToOriginalClosed : P.conjugateToOriginal
  smallPerturbationConditionClosed : P.smallPerturbationCondition
  stabilityUnderPerturbationClosed : P.stabilityUnderPerturbation

def StructuralStabilityClosed {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    {A : GroupActionPackage G X} (P : StructuralStabilityPackage A) : Prop :=
  P.conjugateToOriginal ∧ P.smallPerturbationCondition ∧ P.stabilityUnderPerturbation

theorem structural_stability_closed_from_evidence
    {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    {A : GroupActionPackage G X} (P : StructuralStabilityPackage A)
    (E : StructuralStabilityEvidence P) : StructuralStabilityClosed P := by
  exact And.intro E.conjugateToOriginalClosed
    (And.intro E.smallPerturbationConditionClosed E.stabilityUnderPerturbationClosed)

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse