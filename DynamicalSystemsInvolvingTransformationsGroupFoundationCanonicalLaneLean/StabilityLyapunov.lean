import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure StabilityLyapunovPackage (G : GroupActionDynamicsPackage) where
  lyapunovFunction : G.space → ℝ
  lyapunovStability : Prop
  asymptoticStability : Prop

structure StabilityLyapunovEvidence {G : GroupActionDynamicsPackage}
    (S : StabilityLyapunovPackage G) where
  lyapunovStabilityClosed : S.lyapunovStability
  asymptoticStabilityClosed : S.asymptoticStability

def StabilityLyapunovClosed {G : GroupActionDynamicsPackage}
    (S : StabilityLyapunovPackage G) : Prop :=
  S.lyapunovStability ∧ S.asymptoticStability

theorem stability_lyapunov_closed_from_evidence
    {G : GroupActionDynamicsPackage} (S : StabilityLyapunovPackage G)
    (E : StabilityLyapunovEvidence S) : StabilityLyapunovClosed S := by
  exact And.intro E.lyapunovStabilityClosed E.asymptoticStabilityClosed

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse
