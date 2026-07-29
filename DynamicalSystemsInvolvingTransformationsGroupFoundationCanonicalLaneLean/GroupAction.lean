import Mathlib.Dynamics.Flow
import Mathlib.Data.Set.Basic

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure GroupActionPackage (G : Type u) (X : Type v) [Monoid G] [TopologicalSpace X] where
  action : G → X → X
  continuousAction : Prop
  identityAct : ∀ x : X, action 1 x = x
  compatibleAct : ∀ g h : G, ∀ x : X, action (g * h) x = action g (action h x)

structure GroupActionEvidence {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    (P : GroupActionPackage G X) where
  continuousActionClosed : P.continuousAction
  identityActClosed : P.identityAct
  compatibleActClosed : P.compatibleAct

def GroupActionClosed {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    (P : GroupActionPackage G X) : Prop :=
  P.continuousAction ∧ P.identityAct ∧ P.compatibleAct

theorem group_action_closed_from_evidence
    {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    (P : GroupActionPackage G X) (E : GroupActionEvidence P) : GroupActionClosed P := by
  exact And.intro E.continuousActionClosed (And.intro E.identityActClosed E.compatibleActClosed)

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse