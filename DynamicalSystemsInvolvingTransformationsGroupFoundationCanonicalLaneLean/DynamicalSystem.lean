import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure DynamicalSystem where
  State : Type u
  Time : Type v
  flow : Time → State → State
  initialState : State
  groupAction : State → State → State
  identityAction : ∀ x : State, groupAction x x = x
  associativity : ∀ x y z : State, groupAction (groupAction x y) z = groupAction x (groupAction y z)
  flowCompatibility : ∀ t : Time, ∀ x : State, flow t (groupAction x x) = groupAction (flow t x) x

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse