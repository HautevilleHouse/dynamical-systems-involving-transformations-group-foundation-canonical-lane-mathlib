import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Dynamics.ODE

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure HyperbolicDynamicsPackage {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    (A : GroupActionPackage G X) where
  hyperbolicSet : Set X
  expansionRate : Prop
  contractionRate : Prop
  invariantSplitting : Prop
  shadowingProperty : Prop

structure HyperbolicDynamicsEvidence {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    {A : GroupActionPackage G X} (P : HyperbolicDynamicsPackage A) where
  expansionRateClosed : P.expansionRate
  contractionRateClosed : P.contractionRate
  invariantSplittingClosed : P.invariantSplitting
  shadowingPropertyClosed : P.shadowingProperty

def HyperbolicDynamicsClosed {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    {A : GroupActionPackage G X} (P : HyperbolicDynamicsPackage A) : Prop :=
  P.expansionRate ∧ P.contractionRate ∧ P.invariantSplitting ∧ P.shadowingProperty

theorem hyperbolic_dynamics_closed_from_evidence
    {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    {A : GroupActionPackage G X} (P : HyperbolicDynamicsPackage A)
    (E : HyperbolicDynamicsEvidence P) : HyperbolicDynamicsClosed P := by
  exact And.intro E.expansionRateClosed
    (And.intro E.contractionRateClosed
      (And.intro E.invariantSplittingClosed E.shadowingPropertyClosed))

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse