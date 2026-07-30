import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure ElasticityPackage (C : CrystalStructurePackage) where
  stiffnessTensor : Type u
  complianceTensor : Type v
  youngModulus : ℝ
  poissonRatio : ℝ
  stiffnessTensorWellDefined : Prop
  complianceTensorWellDefined : Prop
  materialStability : Prop

structure ElasticityEvidence (C : CrystalStructurePackage) (E : ElasticityPackage C) where
  stiffnessTensorWellDefinedClosed : E.stiffnessTensorWellDefined
  complianceTensorWellDefinedClosed : E.complianceTensorWellDefined
  materialStabilityClosed : E.materialStability

def ElasticityClosed (C : CrystalStructurePackage) (E : ElasticityPackage C) : Prop :=
  E.stiffnessTensorWellDefined ∧ E.complianceTensorWellDefined ∧ E.materialStability

theorem elasticity_closed_from_evidence
    (C : CrystalStructurePackage) (E : ElasticityPackage C) (Ev : ElasticityEvidence C E) :
    ElasticityClosed C E := by
  exact And.intro Ev.stiffnessTensorWellDefinedClosed
    (And.intro Ev.complianceTensorWellDefinedClosed Ev.materialStabilityClosed)

end HautevilleHouse
end MaterialsBiomaterialsTheoremCanonicalLaneLean