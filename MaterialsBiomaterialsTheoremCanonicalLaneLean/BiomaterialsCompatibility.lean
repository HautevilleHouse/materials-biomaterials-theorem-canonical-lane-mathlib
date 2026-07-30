import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure BiomaterialsPackage where
  hostTissue : Type u
  implantMaterial : Type v
  interfaceReaction : Type w
  biocompatibility : Prop
  mechanicalMatch : Prop
  degradationRate : Prop
  immuneResponse : Prop

structure BiomaterialsEvidence (B : BiomaterialsPackage) where
  biocompatibilityClosed : B.biocompatibility
  mechanicalMatchClosed : B.mechanicalMatch
  degradationRateClosed : B.degradationRate
  immuneResponseClosed : B.immuneResponse

def BiomaterialsClosed (B : BiomaterialsPackage) : Prop :=
  B.biocompatibility ∧ B.mechanicalMatch ∧ B.degradationRate ∧ B.immuneResponse

theorem biomaterials_closed_from_evidence (B : BiomaterialsPackage) (E : BiomaterialsEvidence B) :
  BiomaterialsClosed B := by
  exact And.intro E.biocompatibilityClosed (And.intro E.mechanicalMatchClosed (And.intro E.degradationRateClosed E.immuneResponseClosed))

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse
