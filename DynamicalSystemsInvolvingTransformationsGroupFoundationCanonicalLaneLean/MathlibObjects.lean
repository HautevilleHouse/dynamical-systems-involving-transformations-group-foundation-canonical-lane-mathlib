import DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Dynamics.Flow
import Mathlib.Dynamics.Ergodic

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DynamicalSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  groupAction : carrier → carrier → carrier
  groupIdentity : ∀ x : carrier, groupAction x x = x
  groupInverse : ∀ x : carrier, ∃ y : carrier, groupAction x y = x

structure DynamicalAdmittedObject where
  space : DynamicalSpace
  invariantMeasure : Prop
  ergodicDecomposition : Prop
  transformationGroup : Type
  groupActionTopological : Prop
  conclusion : invariantMeasure ∧ ergodicDecomposition

structure DynamicalEndgameState where
  object : DynamicalAdmittedObject

def DynamicalWitnessClosed (O : DynamicalAdmittedObject) : Prop :=
  O.invariantMeasure ∧ O.ergodicDecomposition

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse