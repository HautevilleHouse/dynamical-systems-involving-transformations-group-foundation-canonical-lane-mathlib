import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean

structure EntropyKolmogorovSinaiPackage (G : GroupActionDynamicsPackage) where
  entropyValue : ℝ
  topologicalEntropy : ℝ
  measureEntropy : ℝ
  variationalPrinciple : Prop

structure EntropyKolmogorovSinaiEvidence {G : GroupActionDynamicsPackage}
    (E : EntropyKolmogorovSinaiPackage G) where
  variationalPrincipleClosed : E.variationalPrinciple

def EntropyKolmogorovSinaiClosed {G : GroupActionDynamicsPackage}
    (E : EntropyKolmogorovSinaiPackage G) : Prop :=
  E.variationalPrinciple

theorem entropy_kolmogorov_sinai_closed_from_evidence
    {G : GroupActionDynamicsPackage} (E : EntropyKolmogorovSinaiPackage G)
    (Ev : EntropyKolmogorovSinaiEvidence E) : EntropyKolmogorovSinaiClosed E := by
  exact Ev.variationalPrincipleClosed

end DynamicalSystemsInvolvingTransformationsGroupFoundationCanonicalLaneLean
end HautevilleHouse
