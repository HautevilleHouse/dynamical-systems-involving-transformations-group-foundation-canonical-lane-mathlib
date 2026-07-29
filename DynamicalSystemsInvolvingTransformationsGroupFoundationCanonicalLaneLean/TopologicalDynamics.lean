import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean.DynamicalSystem
import DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean.GroupAction
import DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean.InvariantSet

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure TopologicalDynamicsPackage {S : DynamicalSystem} {G : GroupActionPackage S} where
  topologicalSpace : TopologicalSpace S.State
  continuousFlow : ∀ t : S.Time, Continuous (S.flow t)
  continuousAction : ∀ g : G.group, Continuous (G.action g)
  minimality : Prop
  topologicalTransitivity : Prop
  denseOrbit : Prop

structure TopologicalDynamicsEvidence {S : DynamicalSystem} {G : GroupActionPackage S}
    (T : TopologicalDynamicsPackage S G) where
  continuousFlowClosed : T.continuousFlow
  continuousActionClosed : T.continuousAction
  minimalityClosed : T.minimality
  topologicalTransitivityClosed : T.topologicalTransitivity
  denseOrbitClosed : T.denseOrbit

def TopologicalDynamicsClosed {S : DynamicalSystem} {G : GroupActionPackage S}
    (T : TopologicalDynamicsPackage S G) : Prop :=
  T.continuousFlow ∧ T.continuousAction ∧ T.minimality ∧
  T.topologicalTransitivity ∧ T.denseOrbit

theorem topological_dynamics_closed_from_evidence
    {S : DynamicalSystem} {G : GroupActionPackage S} (T : TopologicalDynamicsPackage S G)
    (E : TopologicalDynamicsEvidence T) : TopologicalDynamicsClosed T := by
  exact And.intro E.continuousFlowClosed
    (And.intro E.continuousActionClosed
      (And.intro E.minimalityClosed
        (And.intro E.topologicalTransitivityClosed E.denseOrbitClosed)))

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse