import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure SynthesisPackage where
  precursorMaterials : List String
  reactionConditions : Prop
  productCharacterization : Prop
  yieldEfficiency : Prop

structure SynthesisEvidence (S : SynthesisPackage) where
  reactionConditionsClosed : S.reactionConditions
  productCharacterizationClosed : S.productCharacterization
  yieldEfficiencyClosed : S.yieldEfficiency

def SynthesisClosed (S : SynthesisPackage) : Prop :=
  S.reactionConditions ∧ S.productCharacterization ∧ S.yieldEfficiency

theorem synthesis_closed_from_evidence (S : SynthesisPackage) (Ev : SynthesisEvidence S) :
    SynthesisClosed S := by
  exact And.intro Ev.reactionConditionsClosed (And.intro Ev.productCharacterizationClosed Ev.yieldEfficiencyClosed)

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse