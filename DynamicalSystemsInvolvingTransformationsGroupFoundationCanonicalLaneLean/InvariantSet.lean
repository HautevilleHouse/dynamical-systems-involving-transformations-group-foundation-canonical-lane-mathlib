import Mathlib.Dynamics.Flow
import Mathlib.Data.Set.Basic

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure InvariantSetPackage {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    (A : GroupActionPackage G X) where
  invariantSet : Set X
  forwardInvariance : Prop
  backwardInvariance : Prop
  invarianceUnderGroup : Prop

structure InvariantSetEvidence {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    {A : GroupActionPackage G X} (P : InvariantSetPackage A) where
  forwardInvarianceClosed : P.forwardInvariance
  backwardInvarianceClosed : P.backwardInvariance
  invarianceUnderGroupClosed : P.invarianceUnderGroup

def InvariantSetClosed {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    {A : GroupActionPackage G X} (P : InvariantSetPackage A) : Prop :=
  P.forwardInvariance ∧ P.backwardInvariance ∧ P.invarianceUnderGroup

theorem invariant_set_closed_from_evidence
    {G : Type u} {X : Type v} [Monoid G] [TopologicalSpace X]
    {A : GroupActionPackage G X} (P : InvariantSetPackage A)
    (E : InvariantSetEvidence P) : InvariantSetClosed P := by
  exact And.intro E.forwardInvarianceClosed
    (And.intro E.backwardInvarianceClosed E.invarianceUnderGroupClosed)

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse